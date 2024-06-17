using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace s25028_mas.Entities;

[Table("Person")]
public partial class Person
{
    [Key]
    [Column(TypeName = "INT")]
    public int ID_Person { get; set; }

    public string name { get; set; } = null!;

    public string Surname { get; set; } = null!;

    [Column(TypeName = "date")]
    public DateTime Date_of_birth { get; set; }

    [Column(TypeName = "INT")]
    public int age { get; set; }

    [InverseProperty("Person_ID_PersonNavigation")]
    public virtual ICollection<Coach> Coaches { get; set; } = new List<Coach>();

    [InverseProperty("Person_ID_PersonNavigation")]
    public virtual ICollection<Player> Players { get; set; } = new List<Player>();

    [InverseProperty("Person_ID_PersonNavigation")]
    public virtual ICollection<Referee> Referees { get; set; } = new List<Referee>();
}
