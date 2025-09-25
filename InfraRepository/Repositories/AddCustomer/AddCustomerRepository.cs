using Domain.Contracts.Repositories.AddCustomer;
using Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InfraRepository.Repositories.AddCustomer
{
    public class AddCustomerRepository : IAddCustomerRepository
    {
        private readonly IList<Customer> _customers = new List<Customer>();
        public void AddCustomer(Customer customer)
        {
            _customers.Add(customer);
        }
    }
}
