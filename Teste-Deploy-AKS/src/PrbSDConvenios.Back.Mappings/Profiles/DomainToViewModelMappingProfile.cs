using AutoMapper;
using PrbSDConvenios.Back.Domain.Entities;
using PrbSDConvenios.Back.Model.ViewModel.Exemplo;

namespace PrbSDConvenios.Back.Mappings.Profiles
{
    public class DomainToViewModelMappingProfile : Profile
    {
        public DomainToViewModelMappingProfile()
        {
            CreateMap<ExemploSimulacao, SimularContratoNovoViewModel.Response>();
        }
    }
}
