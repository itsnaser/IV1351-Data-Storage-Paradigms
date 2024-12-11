using Radzen;
using Soundgood.Components;
using Soundgood.Core.Services;
namespace Soundgood
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            // Add services to the container.
            builder.Services.AddRazorComponents()
                .AddInteractiveServerComponents();

            //region Changes 
            builder.Services.AddRadzenComponents();
            //endregion

            ConfigureServices(builder.Services);
            var app = builder.Build();

            // Configure the HTTP request pipeline.
            if (!app.Environment.IsDevelopment())
            {
                app.UseExceptionHandler("/Error");
            }

            app.UseStaticFiles();
            app.UseAntiforgery();

            app.MapRazorComponents<App>()
                .AddInteractiveServerRenderMode();

            app.Run();
        }
        // region Changes  
        public static void ConfigureServices(IServiceCollection services)
        {
            services.AddScoped<IDataAccessLayer, DataAccessLayer>();
        }
        //endregion

    }
}
