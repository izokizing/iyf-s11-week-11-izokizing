const mongoose = require('mongoose');

const postSchema = new mongoose.Schema({
    title: {
        type: String,
        required: true
    },

    content: {
        type: String,
        required: true
    },

    author: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'User',
        required: true
    },

    comments: [{
        type: mongoose.Schema.Types.ObjectId,
        ref: 'Comment'
    }]
});

// Virtual populate for comments
postSchema.virtual('commentList', {
    ref: 'Comment',
    localField: '_id',
    foreignField: 'post'
});

// Include virtuals when converting to JSON
postSchema.set('toJSON', {
    virtuals: true
});

postSchema.set('toObject', {
    virtuals: true
});

const Post = mongoose.model('Post', postSchema);

module.exports = Post;

