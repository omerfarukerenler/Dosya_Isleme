using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace WcfService_Tekrar2
{

    [ServiceContract]
    public interface IService1
    {
        [OperationContract] 
       List<tbl_NewVendorData> GetNewVendorData();
      
    }
}
