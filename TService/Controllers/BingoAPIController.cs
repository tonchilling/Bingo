using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using DTO;
using System.Net.Http;
using System.Web;
using System.Web.SessionState;

namespace TService.Controllers
{
    [RoutePrefix("api/BingGO")]
    public class BingoAPIController : ApiController, IRequiresSessionState
    {
        List<BingoDTO> results = new List<BingoDTO>();
        HttpResponseMessage mapMessage = null;
        BAL.BingGoBAL bal = null;
       
        public BingoAPIController()
        {
           

        }

        [HttpGet]
        [Route("GetData")]
        public HttpResponseMessage GetAll()
        {
           
            List<BingoDTO> list = null;
            try
            {
             
                bal = new BAL.BingGoBAL();

                // list = bal.GetDataNormal(25);
                list = bal.GetData(25);







                mapMessage = Request.CreateResponse(HttpStatusCode.OK, list);

            }
            catch (Exception ex)
            {
                mapMessage = Request.CreateResponse(HttpStatusCode.BadRequest, ex.ToString());
            }
            return mapMessage;
        }



        [HttpPost]
        [Route("CheckData")]
        public HttpResponseMessage CheckData([FromBody]BingoChkDTO inputData)
        {

            BingoResultsDTO resultDto = null;
            try
            {

                bal = new BAL.BingGoBAL();

                resultDto = bal.IsPingGO(inputData);


                mapMessage = Request.CreateResponse(HttpStatusCode.OK, resultDto);

            }
            catch (Exception ex)
            {
                mapMessage = Request.CreateResponse(HttpStatusCode.BadRequest, ex.ToString());
            }
            return mapMessage;
        }
    }
}
