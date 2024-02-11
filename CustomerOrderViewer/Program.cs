using System;
using System.Collections;
using System.Collections.Generic;
using CustomerOrderViewer.Models;
using CustomerOrderViewer.Repository;

namespace CustomerOrderViewer
{
    internal class Program
    {
        static void Main(string[] args)
        {
            CustomerOrderDetailCommand customerOrderDetailCommand = new CustomerOrderDetailCommand(@"Data Source=XPS\SQLEXPRESS;Initial Catalog=CustomerOrderViewer;Integrated Security=True;");
            IList<CustomerOrderDetailModel> customerOrderDetialModels = customerOrderDetailCommand.GetList();
            foreach (var model in customerOrderDetialModels)
            {
                Console.WriteLine(model.FirstName);
            }
        }
    }
}
