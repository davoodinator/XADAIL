using System.Collections.Generic;
using System.IO;
using System.Linq;
using System;

namespace MissingFilesSearch.Search
{
    internal class Searcher
    {
        private static int _counter;
        private static int _count;
        private static int _percent;
        private static object _lock = new object();

        public static List<Dto.FilesReference> GetFiles(Arguments.Args args, string pattern = "*")
        {
            _counter = 0;
            _percent = 0;
            var files = Directory.GetFiles(args.Path, "*." + pattern, SearchOption.AllDirectories).ToList();
            _count = files.Count;
            var grimFiles = Directory.GetFiles(args.GrimDawnPath, "*." + pattern, SearchOption.AllDirectories).ToList();
            grimFiles.AddRange(files);
            return files.AsParallel()
                 .Select(x => new Dto.FilesReference { Dbr = x, References = InitializeFilesReferences(x, pattern, grimFiles, args.IgnorePattern) })
                 .Where(x => x.References.Count > 0).ToList();
        }

        private static List<string> InitializeFilesReferences(string file, string pattern, List<string> files, string ignorePattern)
        {
            var references = new List<string>();
            var text = File.ReadAllLines(file).ToList();
            var ignorePatterns = (string.IsNullOrWhiteSpace(ignorePattern) ? "!!!!" : ignorePattern)
                .Split(new[] { ';' }, StringSplitOptions.RemoveEmptyEntries).ToList();
            references.AddRange(text.AsParallel().Where(x => x.EndsWith("." + pattern + ","))
                .Select(x => x.Split(new[] { ',' }, StringSplitOptions.RemoveEmptyEntries)[1].Replace("/", "\\"))
                .SelectMany(x => x.Split(new[] { ';' }, StringSplitOptions.RemoveEmptyEntries))
                .Where(x => !ignorePatterns.Any(y => x.Contains(y)))
                .Where(x => !files.Any(y => y.EndsWith(x, StringComparison.InvariantCultureIgnoreCase)))
                .ToList());
            Increment();
            return references;
        }

        private static void Increment()
        {
            lock (_lock)
            {
                _counter++;
                var percent = (_counter * 100 / _count);
                if (_percent != percent)
                {
                    _percent = percent;
                    Console.SetCursorPosition(0, 0);
                    Console.Write("Validating files: {0}/{1} ({2}%)", _counter, _count, percent);
                }
            }
        }
    }
}
