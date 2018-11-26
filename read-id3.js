import {readID3Tags} from 'read-id3-tags';
 
// Tags can be read from a string
const filePath: string = 'mp3/06-Ave-cajita.wav.mp3';
 
// Tags can be read from a stream
const fileStream: fs.ReadStream = fs.createReadStream(filePath);
 
readID3Tags(filePath).then((data) => {
    // Logs the following data
    console.log(data);
 
}).catch((err) => {
    // Something went wrong
    throw err;
});