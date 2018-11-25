import {readID3Tags} from 'read-id3-tags';
 
// Tags can be read from a string
const filePath: string = 'mp3-192/01-Aurora.mp3';
 
// Tags can be read from a stream
const fileStream: fs.ReadStream = fs.createReadStream(filePath);
 
readID3Tags(filePath).then((data) => {
    // Logs the following data
    // data = { 
    //      title: '',
    //      artist: [],
    //      albumartist: [],
    //      album: '',
    //      year: '',
    //      track: { no: 0, of: 0 },
    //      genre: [],
    //      disk: { no: 0, of: 0 },
    //      picture: [],
    //      duration: 1,
    //      featurings: [] 
    // };
    console.log(data);
 
}).catch((err) => {
    // Something went wrong
    throw err;
})