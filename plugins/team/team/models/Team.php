<?php namespace Team\Team\Models;

use Model;

/**
 * Team Model
 */
class Team extends Model
{
    /**
     * @var string The database table used by the model.
     */
    public $table = 'team_team_teams';

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
    public $attachOne = ['attachments' => ['System\Models\File']];    
    public $attachMany = [];
}
