using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using s25028_mas.Context;
using s25028_mas.Entities;
using s25028_mas.Components;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddRazorComponents()
    .AddInteractiveServerComponents();

// Configure the database context to use SQLite.
builder.Services.AddDbContext<MyDbContext>(options =>
{
    options.UseSqlite(builder.Configuration.GetConnectionString("DefaultConnection"));
});

var app = builder.Build();

using (var scope = app.Services.CreateScope())
{
    var dbContext = scope.ServiceProvider.GetRequiredService<MyDbContext>();

    // Ensure database is created.
    dbContext.Database.EnsureCreated();

    // Example check: Sprawdzenie, czy możemy pobrać zawodnika o ID 1
    var player = dbContext.Players.FirstOrDefault(p => p.ID_Player == 1);
    if (player != null)
    {
        Console.WriteLine($"Znalazłem zawodnika: {player.ID_Player}");
    }
    else
    {
        Console.WriteLine("Nie znaleziono zawodnika o ID 1");
    }
}

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Error", createScopeForErrors: true);
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();
app.UseAntiforgery();

app.MapRazorComponents<App>()
    .AddInteractiveServerRenderMode();

app.Run();