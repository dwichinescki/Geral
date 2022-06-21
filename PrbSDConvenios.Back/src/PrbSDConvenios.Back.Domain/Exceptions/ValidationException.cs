using System;
using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.Runtime.Serialization;
using System.Text;

namespace PrbSDConvenios.Back.Domain.Exceptions
{
    [Serializable]
    [ExcludeFromCodeCoverage]
    public class ValidationException : DomainException
    {
        public override string ErrorCode => Key;

        public string Key { get; private set; }

        public ValidationException()
        {
        }

        public ValidationException(string message) : base(message)
        {
        }

        public ValidationException(string errorCode, string message) : base(message)
        {
            Key = errorCode;
        }

        protected ValidationException(SerializationInfo info, StreamingContext context) : base(info, context)
        {

        }

    }
}
