using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
   public class BingoDTO
    {

        public BingoDTO(int number)
        {
            this.Number = number;
        }
        public int Number { get; set; }
    }


    public class BingoChkDTO
    {

        public BingoChkDTO()
        {
           
        }
        public List<int> SelectNumber { get; set; }
       

        public List<BingoDTO> dataList { get; set; }
    }

    public class BingoResultsDTO
    {
        public bool isValid { get; set; }

        public int[] position { get; set; }
    }
}
