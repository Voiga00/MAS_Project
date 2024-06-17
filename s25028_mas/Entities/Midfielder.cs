using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace s25028_mas.Entities;

[Table("Midfielder")]
public partial class Midfielder
{
    [Key]
    [Column(TypeName = "INT")]
    public int ID_Midfielder { get; set; }

    [Column(TypeName = "INT")]
    public int Pass_accuracy { get; set; }

    [Column(TypeName = "INT")]
    public int FieldPlayer_ID_FieldPlayer { get; set; }

    [ForeignKey("FieldPlayer_ID_FieldPlayer")]
    [InverseProperty("Midfielders")]
    public virtual FieldPlayer FieldPlayer_ID_FieldPlayerNavigation { get; set; } = null!;
}
