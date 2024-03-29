﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VirtualGradingSystem.Models
{
    public class Parent
    {
        // fields
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string FullName => $"{FirstName} {LastName}";

        // EF relations
        public virtual ICollection<Student>? Student { get; set; }
    }
}