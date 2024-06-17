using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace s25028_mas.Entities;

[Table("Referee")]
public partial class Referee
{
    [Key]
    [Column(TypeName = "INT")]
    public int ID_Referee { get; set; }

    public string Ref_certificate { get; set; } = null!;

    [Column(TypeName = "INT")]
    public int Person_ID_Person { get; set; }

    [InverseProperty("Referee_ID_RefereeNavigation")]
    public virtual ICollection<Match> Matches { get; set; } = new List<Match>();

    [ForeignKey("Person_ID_Person")]
    [InverseProperty("Referees")]
    public virtual Person Person_ID_PersonNavigation { get; set; } = null!;
}
