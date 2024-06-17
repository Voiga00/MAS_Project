using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace s25028_mas.Entities;

public partial class Boot
{
    [Key]
    [Column(TypeName = "INT")]
    public int ID_Boots { get; set; }

    [Column(TypeName = "INT")]
    public int size { get; set; }

    [Column(TypeName = "INT")]
    public int Player_ID_Player { get; set; }

    [ForeignKey("Player_ID_Player")]
    [InverseProperty("Boots")]
    public virtual Player Player_ID_PlayerNavigation { get; set; } = null!;
}
