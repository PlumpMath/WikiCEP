using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(WikiCep_Project.Startup))]
namespace WikiCep_Project
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
