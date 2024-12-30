using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace TJRJApp.Models;

public partial class LivroAssunto
{
    public int LivroAssuntoCod { get; set; }
    
    public int? LivroCodl { get; set; }

    public int? AssuntoCodAs { get; set; }
    public virtual Livro? LivroCodlNavigation { get; set; }


}
