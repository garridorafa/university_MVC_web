using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Inscripcion
{
    public partial class Profesiones : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection("Data Source=.;Initial Catalog=dbInscripcion;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                fillGV();
        }

        #region LLENAR DATAGRIDVIEW
        //--Funcion popula datagridview materias
        public DataTable fillGV()
        {
            DataTable dt = new DataTable();

            SqlDataAdapter da = new SqlDataAdapter("spo_InsertarProfesiones", conn);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.AddWithValue("@accion", 3);

            try
            {
                if (conn.State == ConnectionState.Closed)
                    conn.Open();
                da.SelectCommand.ExecuteNonQuery();
                da.Fill(dt);
                gvProfesiones.DataSource = dt;
                gvProfesiones.DataBind();
            }
            catch (Exception ex)
            {
                throw new Exception("Se ha producido un error..." + ex.Message);
            }
            finally
            {
                if (conn.State == ConnectionState.Open)
                    conn.Close();

            }
            return dt;
        }
        #endregion
        #region EDITAR / ELIMINAR REGISTROS
        protected void gvProfesiones_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int Id = 0;
            if (e.CommandName == "btnEditar")
            {
                int row = Convert.ToInt32(e.CommandArgument);
                txtId.Text = gvProfesiones.Rows[row].Cells[0].Text;
                txtDescripcion.Text = gvProfesiones.Rows[row].Cells[1].Text;
            }
            //--Eliminar Registros por Id
            else if (e.CommandName == "btnEliminar")
            {
                int row = Convert.ToInt32(e.CommandArgument);
                Id = Convert.ToInt32(gvProfesiones.DataKeys[row].Value);
                deleteNac(Id);
                fillGV();
                //Msg.Text = "Registro eliminado satisfactoriamente...!";
                //Msg.ForeColor = System.Drawing.Color.Red;
            }
        }
        #endregion
        #region FUNCION ELIMINAR
        //** Función que borra un materia por su id.
        public void deleteNac(int id)
        {
            SqlCommand command = new SqlCommand("spo_InsertarProfesiones", conn);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@id", id);
            command.Parameters.AddWithValue("@accion", 2);
            try
            {
                if (conn.State == ConnectionState.Closed)
                    conn.Open();
                command.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                //Msg.ForeColor = System.Drawing.Color.Red;
            }
            finally
            {
                if (conn.State == ConnectionState.Open)
                    conn.Close();
            }
        }
        #endregion
        #region BUSCAR REGISTROS
        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            dt = fillGV();
            DataView dv = new DataView(dt);

            dv.RowFilter = string.Format("descripcion LIKE '%{0}%' ", txtBuscar.Text);
            gvProfesiones.DataSource = dv;
            gvProfesiones.DataBind();
        }
        #endregion

        protected void gvProfesiones_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvProfesiones.PageIndex = e.NewPageIndex;
            fillGV();
        }
        #region FUNCION INSERTAR
        public string Insertar(classProfesiones mt)
        {
            SqlCommand cmd = new SqlCommand("spo_InsertarProfesiones", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Id", mt.Id);
            cmd.Parameters.AddWithValue("@Descripcion", mt.Descripcion);
            cmd.Parameters.AddWithValue("@fechaReg", mt.fechaReg);
            cmd.Parameters.AddWithValue("@Usr", mt.Usr);
            cmd.Parameters.AddWithValue("@accion", 1);
            try
            {
                if (conn.State == ConnectionState.Closed)
                    conn.Open();

                cmd.ExecuteNonQuery();
            }
            catch (Exception)
            {
                return "Se ha producido un error...";
            }
            finally
            {
                if (conn.State == ConnectionState.Open)
                    conn.Close();
            }

            return "Operacion realizada exitosamente...";
        }

        #endregion

        #region BOTON GUARDAR
        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (txtDescripcion.Text.Trim().Length == 0)
            {
                //Msg.Text = "Datos incompletos...";
                return;
            }

            classProfesiones mt = new classProfesiones();
            mt.Id = txtId.Text.Trim().Length == 0 ? 0 : Convert.ToInt32(txtId.Text);
            mt.Descripcion = txtDescripcion.Text;

            mt.fechaReg = DateTime.Now;
            mt.Usr = "rrodriguez";
            string result = Insertar(mt);
            //Msg.Text = result;
            fillGV();
            txtId.Text = "";
            txtDescripcion.Text = "";
            txtDescripcion.Focus();
        }
        #endregion
    }
}