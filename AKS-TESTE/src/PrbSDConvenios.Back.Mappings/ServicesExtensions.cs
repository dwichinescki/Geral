using AutoMapper;
using Microsoft.Extensions.DependencyInjection;
using PrbSDConvenios.Back.Mappings.Profiles;

namespace PrbSDConvenios.Back.Mappings
{
    public static class ServicesExtensions
    {
        public static IServiceCollection AddMappings(this IServiceCollection services)
        {
            services.AddSingleton(provider => new MapperConfiguration(cfg =>
            {
                cfg.AddProfile(new DomainToViewModelMappingProfile());
                cfg.AddProfile(new ViewModelToDomainMappingProfile());
            }).CreateMapper());

            return services;
        }
    }
}
