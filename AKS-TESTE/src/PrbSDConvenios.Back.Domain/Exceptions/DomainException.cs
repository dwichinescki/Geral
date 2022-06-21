using System;
using System.Runtime.Serialization;

namespace PrbSDConvenios.Back.Domain.Exceptions
{
    public abstract class DomainException : Exception
    {
        public abstract string ErrorCode { get; }

        protected DomainException()
        {
        }

        protected DomainException(string message) : base(message)
        {
        }

        protected DomainException(SerializationInfo info, StreamingContext context) : base(info, context)
        {
        }

    }
}
