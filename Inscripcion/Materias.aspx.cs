using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.VisualBasic;
using System.IO;

namespace Inscripcion
{
    public partial class Materias : System.Web.UI.Page
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

            SqlDataAdapter da = new SqlDataAdapter("spo_InsertarMaterias", conn);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.AddWithValue("@accion", 3);

            try
            {
                if (conn.State == ConnectionState.Closed)
                    conn.Open();
                da.SelectCommand.ExecuteNonQuery();
                da.Fill(dt);
                gvMaterias.DataSource = dt;
                gvMaterias.DataBind();
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

        #region FUNCION INSERTAR
        public string Insertar(classMaterias mt)
        {
            SqlCommand cmd = new SqlCommand("spo_InsertarMaterias", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Id", mt.Id);
            cmd.Parameters.AddWithValue("@Descripcion", mt.Descripcion);
            cmd.Parameters.AddWithValue("@valorCreditos", mt.valorCreditos);
            cmd.Parameters.AddWithValue("@cantidadCreditos", mt.cantidadCreditos);
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
            if (txtDescripcion.Text.Trim().Length == 0
                || txtValorCredito.Text.Trim().Length == 0
                || txtCantidadCredito.Text.Trim().Length == 0
                )
            {
                //Msg.Text = "Datos incompletos...";
                return;
            }

            classMaterias mt = new classMaterias();
            mt.Id = txtIdMaterias.Text.Trim().Length == 0 ? 0 : Convert.ToInt32(txtIdMaterias.Text);
            mt.Descripcion = txtDescripcion.Text;
            mt.cantidadCreditos = Convert.ToInt32(Conversion.Val(txtCantidadCredito.Text));
            mt.valorCreditos = Convert.ToDecimal(Conversion.Val(txtValorCredito.Text));
            mt.fechaReg = DateTime.Now;
            mt.Usr = "rrodriguez";
            string result = Insertar(mt);
            Msg.Text = result;
            fillGV();
            txtIdMaterias.Text = "";
            txtDescripcion.Text = "";
            txtValorCredito.Text = "";
            txtCantidadCredito.Text = "";
            txtDescripcion.Focus();
        }
        #endregion

        #region BUSCAR REGISTROS
        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            dt = fillGV();
            DataView dv = new DataView(dt);

            dv.RowFilter = string.Format("descripcion LIKE '%{0}%' ", txtBuscar.Text);
            gvMaterias.DataSource = dv;
            gvMaterias.DataBind();
        }
        #endregion

        #region EDITAR / ELIMINAR REGISTROS
        protected void gvMaterias_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int Id = 0;
            if (e.CommandName == "btnEditar")
            {
                int row = Convert.ToInt32(e.CommandArgument);
                txtIdMaterias.Text = gvMaterias.Rows[row].Cells[0].Text;
                txtDescripcion.Text = gvMaterias.Rows[row].Cells[1].Text;
                txtValorCredito.Text = gvMaterias.Rows[row].Cells[2].Text;
                txtCantidadCredito.Text = gvMaterias.Rows[row].Cells[3].Text;

            }
            //--Eliminar Registros por Id
            else if (e.CommandName == "btnEliminar")
            {
                int row = Convert.ToInt32(e.CommandArgument);
                Id = Convert.ToInt32(gvMaterias.DataKeys[row].Value);
                deleteMateria(Id);
                fillGV();
                Msg.Text = "Registro eliminado satisfactoriamente...!";
                Msg.ForeColor = System.Drawing.Color.Red;
            }
        }
        #endregion

        #region FUNCION ELIMINAR
        //** Función que borra un materia por su id.
        public void deleteMateria(int id)
        {
            SqlCommand command = new SqlCommand("spo_InsertarMaterias", conn);
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
                Msg.ForeColor = System.Drawing.Color.Red;
            }
            finally
            {
                if (conn.State == ConnectionState.Open)
                    conn.Close();
            }
        }
        #endregion

        #region PAGINACION REGISTROS
        protected void gvMaterias_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvMaterias.PageIndex = e.NewPageIndex;
            fillGV();
        }
        #endregion


         
    }
}