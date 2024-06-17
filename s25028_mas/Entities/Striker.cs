using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace s25028_mas.Entities;

[Table("Striker")]
public partial class Striker
{
    [Key]
    [Column(TypeName = "INT")]
    public int ID_Striker { get; set; }

    [Column(TypeName = "INT")]
    public int Taken_penalties { get; set; }

    [Column(TypeName = "INT")]
    public int FieldPlayer_ID_FieldPlayer { get; set; }

    [ForeignKey("FieldPlayer_ID_FieldPlayer")]
    [InverseProperty("Strikers")]
    public virtual FieldPlayer FieldPlayer_ID_FieldPlayerNavigation { get; set; } = null!;
}
