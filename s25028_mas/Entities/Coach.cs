using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace s25028_mas.Entities;

[Table("Coach")]
public partial class Coach
{
    [Key]
    [Column(TypeName = "INT")]
    public int ID_Coach { get; set; }

    public string UEFA_Certificate { get; set; } = null!;

    [Column(TypeName = "INT")]
    public int Team_ID_team { get; set; }

    [Column(TypeName = "INT")]
    public int Person_ID_Person { get; set; }

    [ForeignKey("Person_ID_Person")]
    [InverseProperty("Coaches")]
    public virtual Person Person_ID_PersonNavigation { get; set; } = null!;

    [ForeignKey("Team_ID_team")]
    [InverseProperty("Coaches")]
    public virtual Team Team_ID_teamNavigation { get; set; } = null!;
}
