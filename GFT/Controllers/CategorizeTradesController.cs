using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using GFT.DTO;
using GFT.Service;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

namespace GFT.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class CategorizeTradesController : ControllerBase
    {
        readonly CategorizeTradesService service = new CategorizeTradesService();

        public List<string> Categorize(List<InputTrade> trades)
        { 
            return service.Categorize(trades);
        }
    }
}
