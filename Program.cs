int SettingsFromString(string settings) => Convert.ToInt32(settings, 2);
string SettingsToString(int settings) => Convert.ToString(settings, 2).PadLeft(8, '0');
bool IsFeatureEnabled(string settings, int feature) => (SettingsFromString(settings) & (1 << (feature - 1))) != 0;

string SetFeature(string settings, int feature, bool enable)
{
    int settingsInt = SettingsFromString(settings);
    settingsInt = enable ? (settingsInt | (1 << (feature - 1))) : (settingsInt & ~(1 << (feature - 1)));
    return SettingsToString(settingsInt);
}

void SaveSettingsToFile(string settings, string filePath) => File.WriteAllBytes(filePath, BitConverter.GetBytes(SettingsFromString(settings)));

string LoadSettingsFromFile(string filePath) => SettingsToString(BitConverter.ToInt32(File.ReadAllBytes(filePath), 0));

string settings = "00000000"; 
settings = SetFeature(settings, 7, true);
settings = SetFeature(settings, 4, true);
SaveSettingsToFile(settings, "userSettings.bin");

string loadedSettings = LoadSettingsFromFile("userSettings.bin");
Console.WriteLine(IsFeatureEnabled(loadedSettings, 7));
Console.WriteLine(IsFeatureEnabled(loadedSettings, 4));
Console.WriteLine(loadedSettings);