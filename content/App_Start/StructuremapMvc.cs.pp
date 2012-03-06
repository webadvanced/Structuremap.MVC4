using System.Web.Http;
using System.Web.Mvc;
using StructureMap;
using StructureMap.ServiceLocatorAdapter;

[assembly: WebActivator.PreApplicationStartMethod(typeof($rootnamespace$.App_Start.StructuremapMvc), "Start")]

namespace $rootnamespace$.App_Start {
    public static class StructuremapMvc {
        public static void Start() {
            var container = (IContainer) IoC.Initialize();
            DependencyResolver.SetResolver(new SmDependencyResolver(container));
			// this override is needed because WebAPI is not using DependencyResolver to build controllers 
			GlobalConfiguration.Configuration.ServiceResolver.SetResolver(new StructureMapServiceLocator(container));
        }
    }
}