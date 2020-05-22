using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Inscripcion
{
    public class classMaterias
    {
        public int Id { get; set; }
        public string Descripcion { get; set; }
        public int cantidadCreditos { get; set; }
        public decimal valorCreditos { get; set; }
        public DateTime fechaReg { get; set; }
        public string Usr { get; set; }

    }
    public class classNac
    {
        public int Id { get; set; }
        public string Descripcion { get; set; }
        public DateTime fechaReg { get; set; }
        public string Usr { get; set; }

    }
    public class classProfesiones
    {
        public int Id { get; set; }
        public string Descripcion { get; set; }
        public DateTime fechaReg { get; set; }
        public string Usr { get; set; }

    }
    public class classProfesores
    {
        public int Id { get; set; }
        public string nombre { get; set; }
        public string apellidos { get; set; }
        public DateTime fechaReg { get; set; }
        public string Usr { get; set; }

    }
}
