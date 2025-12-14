var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

app.MapGet("/", () => "Hello, DevOps Tasks attempt after installing .NET dependencies after installing .NET dependencies");

app.Run();
