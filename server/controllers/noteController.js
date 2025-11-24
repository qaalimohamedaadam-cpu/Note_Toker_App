import Note from "../models/Note.js";

export const createNote = async (req, res) => {
  const { title, content } = req.body;
  try {
    const note = new Note({
    // userId: req.user,
     title,
     content
    });
    await note.save();

     res.status(200).json({
      success: true,
      data: note,
      message: "note created successful",
    });
  } catch (error) {
    res.status(500).json({ 
      message: "Server error" ,
      error: error});
      console.log(error);
      
  }
};

export const getNotes = async (req, res) => {
  try {
    const notes = await Note.find({ userId: req.user });
    res.json(notes);
  } catch (error) {
    res.status(500).json({ message: "Server error" });
  }
};

export const deleteNote = async (req, res) => {
  try {
    const note = await Note.findById(req.params.id);

    if (!note) return res.status(404).json({ message: "Note not found" });

    

    await note.deleteOne();
    res.json({ message: "Note removed" });
  } catch (error) {
    res.status(500).json({ message: "Server error" ,
    error: error
    });
  }
};

export const updateNote = async (req, res) => {
  try {
    const { id } = req.params;
    const { title, content } = req.body;  
    const note = await Note.findById(id);

    if (!note) {
      return res.status(404).json({ 
        success: false,
        data: null,
        message: "Note not found" 
      });
    }

    note.title = title;
    note.content = content;

    await note.save();

    res.json({
      success: true,
      data: note,
      message: "Note updated successfully"
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: "Server error",
      error: error
    });
  }
};