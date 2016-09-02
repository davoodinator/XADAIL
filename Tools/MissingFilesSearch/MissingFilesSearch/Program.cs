
using System.IO;
using System.Text;

namespace MissingFilesSearch
{
    class Program
    {
        static void Main(string[] args)
        {
            var arguments = new Arguments.ArgumentReader(args).GetArgs();
            if(!string.IsNullOrWhiteSpace(arguments.Path))
            {
                var files = Search.Searcher.GetFiles(arguments, "dbr");
                var sbuilder = new StringBuilder();
                foreach (var item in files)
                {
                    sbuilder.AppendLine(item.ToString());
                    sbuilder.AppendLine("");
                }
                File.WriteAllText(string.Format("missing.{0:yyyyMMddHHmmss}.txt", System.DateTime.Now), sbuilder.ToString());
            }            
        }
    }
}
