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
            try
            {
                CustomerOrderDetailCommand customerOrderDetailCommand = new CustomerOrderDetailCommand(@"Data Source=XPS\SQLEXPRESS;Initial Catalog=CustomerOrderViewer;Integrated Security=True;");
                IList<CustomerOrderDetailModel> customerOrderDetialModels = customerOrderDetailCommand.GetList();
                foreach (CustomerOrderDetailModel model in customerOrderDetialModels)
                {
                    Console.WriteLine("{0}: Fullname: {1} {2} (id: {3}) - purchased {4} for {5} (id: {6})",
                        model.CustomerOrderId,
                        model.FirstName,
                        model.LastName,
                        model.CustomerId,
                        model.Description,
                        model.Price,
                        model.ItemId
                        );
                }
            } catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }
    }
}
