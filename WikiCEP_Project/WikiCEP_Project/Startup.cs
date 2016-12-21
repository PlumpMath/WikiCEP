using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(WikiCEP_Project.Startup))]
namespace WikiCEP_Project
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
