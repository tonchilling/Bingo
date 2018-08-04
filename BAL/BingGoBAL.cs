using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DTO;
namespace BAL
{
   public class BingGoBAL
    {


        public List<BingoDTO> GetData(int count)
        {
            List<BingoDTO> DataList = new List<BingoDTO>();

            for(int i=0;i< count;i++)
            { 
            Random r = new Random();
              int  num = r.Next(1, 100);


                do
                {
                    num = r.Next(1, 100);
                } while (DataList.Find(data => (data.Number == num)) != null);


                DataList.Add(new BingoDTO(num));


            }
            return DataList;
        }

        public List<BingoDTO> GetDataNormal(int count)
        {
            List<BingoDTO> DataList = new List<BingoDTO>();

            for (int i = 0; i < count; i++)
            {
              

                DataList.Add(new BingoDTO(i));


            }
            return DataList;
        }



        public BingoResultsDTO IsPingGO(BingoChkDTO data)
        {
            bool isVald = false;
            List<int[]> trueDataList = new List<int[]>();

            List<int[]> truePoitionList = new List<int[]>();

            BingoResultsDTO resultDto = new BingoResultsDTO();
            resultDto.isValid = isVald;

            int[] trueData;
           List<int> keepData;
            int[] matchTotal;



            #region keep true Postion
            trueData = new int[] { 0, 1, 2, 3, 4 };
            truePoitionList.Add(trueData);

            trueData = new int[] { 0, 5, 10, 15, 20 };
            truePoitionList.Add(trueData);


            trueData = new int[] { 0, 6, 12, 18, 24 };
            truePoitionList.Add(trueData);

            trueData = new int[] { 1, 6, 11, 16, 21 };
            truePoitionList.Add(trueData);

            trueData = new int[] { 2, 7, 12, 17, 22 };
            truePoitionList.Add(trueData);

            trueData = new int[] { 3, 8, 13, 18, 23 };
            truePoitionList.Add(trueData);

            trueData = new int[] { 4, 9, 14, 19, 24 };
            truePoitionList.Add(trueData);


            trueData = new int[] { 4, 8, 12, 16, 20 };
            truePoitionList.Add(trueData);



            trueData = new int[] { 5, 6, 7, 8, 9 };
            truePoitionList.Add(trueData);

            trueData = new int[] { 10, 11, 12, 13, 14 };
            truePoitionList.Add(trueData);

            trueData = new int[] { 15, 16, 17, 18, 19 };
            truePoitionList.Add(trueData);


            trueData = new int[] { 20,21,22,23,24 };
            truePoitionList.Add(trueData);


            trueData = new int[] { 20, 21, 22, 23, 24 };
            truePoitionList.Add(trueData);

            #endregion


            #region keep true Data by Postion



            foreach (int[] positions in truePoitionList)
            {
                keepData = new List<int>();
                foreach (int p in positions)
                {
                    keepData.Add(data.dataList[p].Number);


                }

                trueDataList.Add(keepData.ToArray());


            }


            #endregion


            #region Check Data

            int row = 0;
            foreach(int[] temp in trueDataList)
            {
              

                matchTotal = data.SelectNumber.FindAll(p=>temp.Contains(p)).ToArray();

                 resultDto.isValid = isVald;
                if (matchTotal.Length == 5)
                {
                    isVald = true;
                    resultDto.isValid = isVald;
                    resultDto.position = truePoitionList[row];
                    break;
                }
                row++;
            }

            #endregion


            return resultDto;

        }
    }
}
