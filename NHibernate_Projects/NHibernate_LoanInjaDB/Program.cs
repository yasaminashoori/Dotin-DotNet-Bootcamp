using NHibernate_LoanInjaDB.Infra;

var builder = WebApplication.CreateBuilder(args);

var connection = "data source=.;initial catalog=Loaninja_Core;Integrated Security=True;";
builder.Services.AddNHibernate(connection);


// Add services to the container.
builder.Services.AddControllersWithViews();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
}
app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();