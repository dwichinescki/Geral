using AutoMapper;
using PrbSDConvenios.Back.Domain.Entities;
using PrbSDConvenios.Back.Model.ViewModel.Exemplo;

namespace PrbSDConvenios.Back.Mappings.Profiles
{
    public class ViewModelToDomainMappingProfile : Profile
    {
        public ViewModelToDomainMappingProfile()
        {
            CreateMap<SimularContratoNovoViewModel.Request, ExemploSimulacao>();
        }
    }
}
