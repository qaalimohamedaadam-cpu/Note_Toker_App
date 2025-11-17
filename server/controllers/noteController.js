import Note from "../models/Note.js";

export const createNote = async (req, res) => {
  try {
    const note = await Note.create({
      userId: req.user,
      title: req.body.title,
      content: req.body.content,
    });

    res.json(note);
  } catch (error) {
    res.status(500).json({ message: "Server error" });
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

    if (note.userId.toString() !== req.user)
      return res.status(403).json({ message: "Unauthorized" });

    await note.deleteOne();
    res.json({ message: "Note removed" });
  } catch (error) {
    res.status(500).json({ message: "Server error" });
  }
};
