using FluentValidation;
using PrbSDConvenios.Back.Model.ViewModel.Exemplo;

namespace PrbSDConvenios.Back.Application.Validator.ViewModel.Exemplo
{
    public class SimularContratoNovoValidator
    {
        public class Request : AbstractValidator<SimularContratoNovoViewModel.Request>
        {
            public Request()
            {
                RuleFor(x => x.Cpf)
                    .NotEmpty().WithMessage("O Cpf é obrigatório")
                               .WithErrorCode("CPF_OBRIGATORIO");

                RuleFor(x => x.ValorParcela)
                    .GreaterThan(0).WithMessage("O Valor da Parcela deve ser superior a 0")
                                   .WithErrorCode("VALOR_DA_PARCELA_IGUAL_A_ZERO");
            }
        }
    }
}