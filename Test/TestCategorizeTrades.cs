using GFT.Controllers;
using GFT.DTO;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Collections.Generic;

namespace Test
{
    [TestClass]
    public class TestCategorizeTrades
    {
        [TestMethod]
        public void TestCategorize()
        {
            var portifolio = new List<InputTrade>();

            var trade = new InputTrade();
            var trade2 = new InputTrade();
            var trade3 = new InputTrade();
            var trade4 = new InputTrade();

            trade.Value = 2000000; trade.ClientSector = "Private";
            portifolio.Add(trade);
            trade2.Value = 400000; trade2.ClientSector = "Public";
            portifolio.Add(trade2);
            trade3.Value = 500000; trade3.ClientSector = "Public";
            portifolio.Add(trade3);
            trade4.Value = 3000000; trade4.ClientSector = "Public";
            portifolio.Add(trade4);

            var categorize = new CategorizeTradesController();

            var result = categorize.Categorize(portifolio);

        }
    }
}
