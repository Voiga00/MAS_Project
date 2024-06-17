using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace s25028_mas.Entities;

[Table("Goalkeeper")]
public partial class Goalkeeper
{
    [Key]
    [Column(TypeName = "INT")]
    public int ID_Goalkeeper { get; set; }

    [Column(TypeName = "INT")]
    public int gloves { get; set; }

    [Column(TypeName = "INT")]
    public int saves { get; set; }

    [Column(TypeName = "INT")]
    public int Player_ID_Player { get; set; }

    [ForeignKey("Player_ID_Player")]
    [InverseProperty("Goalkeepers")]
    public virtual Player Player_ID_PlayerNavigation { get; set; } = null!;
}
