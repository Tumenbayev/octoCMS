<?php namespace Faq\Faq\Models;

use Model;

/**
 * faq Model
 */
class Faq extends Model
{
    /**
     * @var string The database table used by the model.
     */
    public $table = 'faq_faq_faqs';

    /**
     * @var array Guarded fields
     */
    protected $guarded = ['*'];

    /**
     * @var array Fillable fields
     */
    protected $fillable = [];

    /**
     * @var array Relations
     */
    public $hasOne = [];
    public $hasMany = [];
    public $belongsTo = [];
    public $belongsToMany = [];
    public $morphTo = [];
    public $morphOne = [];
    public $morphMany = [];
    public $attachOne = [];
    public $attachMany = [];
}
