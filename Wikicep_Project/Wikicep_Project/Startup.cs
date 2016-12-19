using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Wikicep_Project.Startup))]
namespace Wikicep_Project
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
