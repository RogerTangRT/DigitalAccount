using Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Contracts.Repositories.AddCustomer
{
    public interface IAddCustomerRepository
    {
        public void AddCustomer(Customer customer);
    }
}
