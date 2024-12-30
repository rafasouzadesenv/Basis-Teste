using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace TJRJApp.Models;

public partial class LivroAutor
{
    public int LivroAutorCod { get; set; }

    public int? AutorCodAu { get; set; }
    
    public int? LivroCodl { get; set; }

    public virtual Livro? LivroCodlNavigation { get; set; }


}
