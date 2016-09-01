using System.Collections.Generic;
using System.IO;
using System.Linq;
using System;

namespace MissingFilesSearch.Search
{
    internal class Searcher
    {
        public static List<Dto.FilesReference> GetFiles(string path, string grimDawnPath, string pattern = "*")
        {
            var files = Directory.GetFiles(path, "*." + pattern, SearchOption.AllDirectories).ToList();
            var grimFiles = Directory.GetFiles(grimDawnPath, "*." + pattern, SearchOption.AllDirectories).ToList();
            grimFiles.AddRange(files);
            return files.AsParallel()
                 .Select(x => new Dto.FilesReference { Dbr = x, References = InitializeFilesReferences(x, pattern, grimFiles) })
                 .Where(x => x.References.Count > 0).ToList();
        }

        private static List<string> InitializeFilesReferences(string file, string pattern, List<string> files)
        {
            var references = new List<string>();
            var text = File.ReadAllLines(file).ToList();
            references.AddRange(text.AsParallel().Where(x => x.EndsWith("." + pattern + ","))
                .Select(x => x.Split(new[] { ',' }, StringSplitOptions.RemoveEmptyEntries)[1].Replace("/", "\\"))
                .SelectMany(x => x.Split(new[] { ';' }, StringSplitOptions.RemoveEmptyEntries))
                .Where(x => !files.Any(y => y.EndsWith(x, StringComparison.InvariantCultureIgnoreCase)))
                .ToList());                     
            return references;
        }
    }
}
