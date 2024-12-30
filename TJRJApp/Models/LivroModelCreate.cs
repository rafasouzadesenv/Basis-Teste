using System.ComponentModel.DataAnnotations;

namespace TJRJApp.Models
{
    public class LivroModelCreate
    {
        public int LivroCodl { get; set; }

        public string? Titulo { get; set; }

        public string? Editora { get; set; }

        public int? Edicao { get; set; }
        public int? TipoAquisicaoID { get; set; }
        public int? AssuntoID { get; set; }
        public int? AutorID { get; set; }
        public double? Preco { get; set; }

        public string? AnoPublicacao { get; set; }

        

    }
}
