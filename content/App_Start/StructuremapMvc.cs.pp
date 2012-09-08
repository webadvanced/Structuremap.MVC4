using System.Web.Http;
using System.Web.Mvc;
using StructureMap;
using $rootnamespace$.DependencyResolution;

[assembly: WebActivator.PreApplicationStartMethod(typeof($rootnamespace$.App_Start.StructuremapMvc), "Start")]

namespace $rootnamespace$.App_Start {
    public static class StructuremapMvc {
        public static void Start() {
			IContainer container = IoC.Initialize();
            DependencyResolver.SetResolver(new StructureMapDependencyResolver(container));
            GlobalConfiguration.Configuration.DependencyResolver = new StructureMapDependencyResolver(container);
        }
    }
}