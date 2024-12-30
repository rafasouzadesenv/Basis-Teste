using System;
using System.Collections.Generic;

namespace TJRJApp.Models;

public partial class LivroAquisicao
{
    public int CodAq { get; set; }

    public int? LivroCodl { get; set; }

    public decimal? Valor { get; set; }

    public int? TipoAquisicaoCod { get; set; }

    public virtual Livro? LivroCodlNavigation { get; set; }

    public virtual TipoAquisicao? TipoAquisicaoCodNavigation { get; set; }
}
