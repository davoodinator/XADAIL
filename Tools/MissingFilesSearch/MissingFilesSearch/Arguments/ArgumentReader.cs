namespace MissingFilesSearch.Arguments
{
    public class ArgumentReader
    {
        private readonly Utilities.Arguments _commandLine;

        public ArgumentReader(string[] args)
        {
            _commandLine = new Utilities.Arguments(args);
        }

        internal Args GetArgs()
        {
            var result = new Args();

            result.Help = GetBoolValue(nameof(result.Help));
            result.Path = GetStringValue(nameof(result.Path));
            result.GrimDawnPath = GetStringValue(nameof(result.GrimDawnPath));
            return result;
        }

        private bool GetBoolValue(string propertyName)
        {
            var temp = GetStringValue(propertyName);
            return !string.IsNullOrEmpty(temp) ? bool.Parse(temp) : false;
        }

        private string GetStringValue(string propertyName)
        {
            var result = string.Empty;
            if (_commandLine[propertyName] != null)
            {
                result = _commandLine[propertyName];
            }
            return result;
        }
    }
}
