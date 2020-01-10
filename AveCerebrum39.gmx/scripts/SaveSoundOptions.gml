SoundOptions = file_text_open_write("SoundOptions");

file_text_write_string(SoundOptions,"MusicVol:");
file_text_writeln(SoundOptions);
file_text_write_real(SoundOptions,oBackgroundMusic.AudioGain);
file_text_writeln(SoundOptions);

file_text_write_string(SoundOptions,"SFXVol:");
file_text_writeln(SoundOptions);
file_text_write_real(SoundOptions,oSFX.SFXGain);

file_text_close(SoundOptions);
