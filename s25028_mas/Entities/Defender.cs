using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace s25028_mas.Entities;

[Table("Defender")]
public partial class Defender
{
    [Key]
    [Column(TypeName = "INT")]
    public int ID_Defender { get; set; }

    [Column(TypeName = "INT")]
    public int Tackles { get; set; }

    [Column(TypeName = "INT")]
    public int FieldPlayer_ID_FieldPlayer { get; set; }

    [ForeignKey("FieldPlayer_ID_FieldPlayer")]
    [InverseProperty("Defenders")]
    public virtual FieldPlayer FieldPlayer_ID_FieldPlayerNavigation { get; set; } = null!;
}
