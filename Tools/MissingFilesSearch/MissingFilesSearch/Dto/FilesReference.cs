using System.Collections.Generic;
using System.Linq;
using System;

namespace MissingFilesSearch.Dto
{
    public class FilesReference
    {
        public string Dbr { get; set; }
        public List<string> References { get; set; } = new List<string>();

        public override string ToString()
        {
            return Dbr + Environment.NewLine + "\t" + References.Aggregate((x, y) => x + Environment.NewLine + "\t" + y);
        }
    }
}
