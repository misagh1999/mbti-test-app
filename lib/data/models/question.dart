import 'package:get/get.dart';

class Question {
  final int index;
  RxInt selectedOption;
  final String option1, option2, type1, type2;

  Question(
      {required this.index,
      required this.selectedOption,
      required this.option1,
      required this.option2,
      required this.type1,
      required this.type2});
}

abstract class Types {
  static const E = "E"; // extrovert
  static const I = "I"; // introvert

  static const N = "N"; // intuitive
  static const S = "S"; // sensing

  static const F = "F"; // feeling
  static const T = "T"; // thinking

  static const P = "P"; // perceiving
  static const J = "J"; // judging
}

const List sample_data = [
  {
    "index": 1,
    "option1": "I usually keep my feelings and emotions to myself.",
    "option2": "I usually share my feelings and emotions with others easily.",
    "type1": Types.I,
    "type2": Types.E
  },
  {
    "index": 2,
    "option1": "Certain, objective and specific matters are important to me.",
    "option2": "Ideas, inferences and inspirations are important to me.",
    "type1": Types.S,
    "type2": Types.N
  },
  {
    "index": 3,
    "option1":
        "When making a decision, I act on what logic and wisdom dictate.",
    "option2":
        "When making a decision, I act on what my feelings and my heart tell me.",
    "type1": Types.T,
    "type2": Types.F
  },
  {
    "index": 4,
    "option1": "I like to live in flexible and changing conditions.",
    "option2": "I like everything to be organized and planned.",
    "type1": Types.P,
    "type2": Types.J
  },
  {
    "index": 5,
    "option1":
        "I like to have information in limited fields, but deep and complete in every field.",
    "option2":
        "I like to have information in many fields, but in each field to a limited extent.",
    "type1": Types.I,
    "type2": Types.E
  },
  {
    "index": 6,
    "option1":
        "Most of the time I pay attention to objective facts (what exists).",
    "option2":
        "Most of the time I visualize the facts (what should exist) in my mind and imagination.",
    "type1": Types.S,
    "type2": Types.N
  },
  {
    "index": 7,
    "option1":
        "In my opinion, a just judge and judge is more useful for the society.",
    "option2":
        "In my opinion, a kind teacher and trainer is more useful for the society.",
    "type1": Types.T,
    "type2": Types.F
  },
  {
    "index": 8,
    "option1":
        "Preferably, I do my meetings and meetings without prior plans and freely.",
    "option2": "I prefer to meet people and schedule my meeting in advance.",
    "type1": Types.P,
    "type2": Types.J
  },
  {
    "index": 9,
    "option1":
        "I am quiet and cautious and I am not interested in drawing attention to myself.",
    "option2": "I attract the attention of others.",
    "type1": Types.I,
    "type2": Types.E
  },
  {
    "index": 10,
    "option1":
        "If I were a teacher, I would prefer to teach lessons that include facts and definite matters.",
    "option2":
        "If I were a teacher, I would prefer to teach subjects that include facts and theories (such as philosophy).",
    "type1": Types.S,
    "type2": Types.N
  },
  {
    "index": 11,
    "option1": "I am decisive, strong and firm.",
    "option2": "I am flexible, gentle and kind.",
    "type1": Types.T,
    "type2": Types.F
  },
  {
    "index": 12,
    "option1": "I often forget to do trivial and minor tasks.",
    "option2":
        "In order to prevent forgetting to do things, I write them down.",
    "type1": Types.P,
    "type2": Types.J
  },
  {
    "index": 13,
    "option1":
        "At parties, meetings and gatherings, I wait for others to come to me.",
    "option2":
        "In parties, meetings, and gatherings, I open the conversation with others.",
    "type1": Types.I,
    "type2": Types.E
  },
  {
    "index": 14,
    "option1": "I pay a lot of attention to details.",
    "option2":
        "The generality of any subject is important to me and I don't pay much attention to its details.",
    "type1": Types.S,
    "type2": Types.N
  },
  {
    "index": 15,
    "option1": "I attach great importance to the future and plan for it.",
    "option2": "I don't think much about the future.",
    "type1": Types.T,
    "type2": Types.F
  },
  {
    "index": 16,
    "option1":
        "Usually, I start the work and during the execution, I deal with the implementation problems and the necessary preparations.",
    "option2": "I do planning before implementing projects and works.",
    "type1": Types.P,
    "type2": Types.J
  },
  {
    "index": 17,
    "option1":
        "I would like to have few friends with a lot of close communication.",
    "option2":
        "I would like to have many friends with limited communication.",
    "type1": Types.I,
    "type2": Types.E
  },
  {
    "index": 18,
    "option1": "I emphasize using the available facilities and abilities.",
    "option2": "Innovation and creativity in work is a priority for me.",
    "type1": Types.S,
    "type2": Types.N
  },
  {
    "index": 19,
    "option1": "I mostly follow logic and reason.",
    "option2": "I mostly follow feelings and emotions.",
    "type1": Types.T,
    "type2": Types.F
  },
  {
    "index": 20,
    "option1":
        "I am successful in doing tasks that are not foreseen or activities that require speed and immediate reaction.",
    "option2":
        "I am successful in doing things that are based on the previous plan.",
    "type1": Types.P,
    "type2": Types.J
  },
  {
    "index": 21,
    "option1":
        "Usually, I have few friends, but I have close relations with them.",
    "option2":
        "Usually, I have friendship and acquaintance with many people.",
    "type1": Types.I,
    "type2": Types.E
  },
  {
    "index": 22,
    "option1":
        "I mostly enjoy life in the present and I don't think much about the future.",
    "option2": "I pay a lot of attention to the future and predict it.",
    "type1": Types.S,
    "type2": Types.N
  },
  {
    "index": 23,
    "option1": "Usually my brain rules over my heart.",
    "option2": "Usually my heart rules over my brain.",
    "type1": Types.T,
    "type2": Types.F
  },
  {
    "index": 24,
    "option1":
        "Usually, in my daily work, I would like to act according to the necessities and emergencies that occur.",
    "option2": "I usually like to follow the plan in my daily work.",
    "type1": Types.P,
    "type2": Types.J
  },
  {
    "index": 25,
    "option1":
        "I talk less about my inner feelings and emotions with others.",
    "option2": "I express my thoughts and emotions freely and easily.",
    "type1": Types.I,
    "type2": Types.E
  },
  {
    "index": 26,
    "option1": "I prefer and use specific and precise words.",
    "option2": "I prefer and use allegorical and ironic words.",
    "type1": Types.S,
    "type2": Types.N
  },
  {
    "index": 27,
    "option1":
        "In making decisions, observing justice and fairness is more important to me than anything else.",
    "option2":
        "In making decisions, taking into account the current situation and conditions of others is more important to me than anything else.",
    "type1": Types.T,
    "type2": Types.F
  },
  {
    "index": 28,
    "option1":
        "Usually, I start the work and fix the problems during execution.",
    "option2":
        "Usually, before starting the work, I prepare the preparations and predict the problems.",
    "type1": Types.P,
    "type2": Types.J
  },
  {
    "index": 29,
    "option1": "I prefer individual work.",
    "option2": "I prefer group work.",
    "type1": Types.I,
    "type2": Types.E
  },
  {
    "index": 30,
    "option1": "The facts (what is) and phenomena are interesting to me.",
    "option2": "I am interested in facts (what should be) and ideas.",
    "type1": Types.S,
    "type2": Types.N
  },
  {
    "index": 31,
    "option1": "I value justice and fairness.",
    "option2": "I value giving and giving.",
    "type1": Types.T,
    "type2": Types.F
  },
  {
    "index": 32,
    "option1":
        "I consider making a list of things that should be done on a day off to be pointless and futile.",
    "option2":
        "I consider preparing a list of things to be done on the day off as a serious and useful thing.",
    "type1": Types.P,
    "type2": Types.J
  },
  {
    "index": 33,
    "option1":
        "Usually at parties and gatherings, I talk to a person or persons that I already know.",
    "option2":
        "I usually look for new people at parties and gatherings to talk to and get to know.",
    "type1": Types.I,
    "type2": Types.E
  },
  {
    "index": 34,
    "option1": "My friends are mostly realistic.",
    "option2": "Most of my friends are those who have a strong imagination.",
    "type1": Types.S,
    "type2": Types.N
  },
  {
    "index": 35,
    "option1":
        "In my opinion, a person who deals with issues with reasons and arguments is better.",
    "option2":
        "In my opinion, a person who deals with issues with real emotion and feeling and compassion is better.",
    "type1": Types.T,
    "type2": Types.F
  },
  {
    "index": 36,
    "option1":
        "I often don't consider myself obliged to do things at a specific time and I don't limit myself to time.",
    "option2":
        "I often determine my plan clearly and precisely and insist on doing them at the appointed time.",
    "type1": Types.P,
    "type2": Types.J
  },
  {
    "index": 37,
    "option1": "I am calm and thoughtful.",
    "option2": "I am cheerful and active.",
    "type1": Types.I,
    "type2": Types.E
  },
  {
    "index": 38,
    "option1": "I like to be a realistic and accurate person.",
    "option2": "I like to be an innovative and creative person.",
    "type1": Types.S,
    "type2": Types.N
  },
  {
    "index": 39,
    "option1": "I am interested in analyzing topics.",
    "option2":
        "I am interested in movies and emotional discussions that deal with human issues.",
    "type1": Types.T,
    "type2": Types.F
  },
  {
    "index": 40,
    "option1":
        "Usually, I organize and manage my life according to the circumstances that occur.",
    "option2":
        "I usually write down the things I want to do, or at least remember regularly.",
    "type1": Types.P,
    "type2": Types.J
  },
  {
    "index": 41,
    "option1": "I am short of words.",
    "option2": "I am talkative.",
    "type1": Types.I,
    "type2": Types.E
  },
  {
    "index": 42,
    "option1": "I accept any new idea if it is feasible.",
    "option2":
        "I value every new idea because it is new (regardless of whether it is practical or not).",
    "type1": Types.S,
    "type2": Types.N
  },
  {
    "index": 43,
    "option1": "I like to be a thoughtful person who behaves wisely.",
    "option2":
        "I like to be an emotional person who deals with human feelings.",
    "type1": Types.T,
    "type2": Types.F
  },
  {
    "index": 44,
    "option1":
        "Some people consider me a disorderly person with a busy life.",
    "option2": "Some people consider me a dry and inflexible person.",
    "type1": Types.P,
    "type2": Types.J
  },
  {
    "index": 45,
    "option1":
        "After sufficient pause and reflection, I will comment on the discussion or the questions raised.",
    "option2":
        "I ask questions or express my opinion whenever I get a chance.",
    "type1": Types.I,
    "type2": Types.E
  },
  {
    "index": 46,
    "option1": "I like stability and strength.",
    "option2": "I like change and flexibility.",
    "type1": Types.S,
    "type2": Types.N
  },
  {
    "index": 47,
    "option1": "I use more logical conclusions and arguments.",
    "option2":
        "I act mostly based on personal feelings and opinions towards life or people.",
    "type1": Types.T,
    "type2": Types.F
  },
  {
    "index": 48,
    "option1":
        "I do things freely and without pressure whenever it is appropriate and the opportunity arises.",
    "option2":
        "It is important to know in advance what work or what they expect me to do.",
    "type1": Types.P,
    "type2": Types.J
  },
  {
    "index": 49,
    "option1": "I prefer to be introduced by another person.",
    "option2": "Usually in the crowd, I introduce others to each other.",
    "type1": Types.I,
    "type2": Types.E
  },
  {
    "index": 50,
    "option1": "I try to do the planned steps in order.",
    "option2": "When doing things, I skip the unimportant parts of it.",
    "type1": Types.S,
    "type2": Types.N
  },
  {
    "index": 51,
    "option1":
        "Regarding any group or people of the organization that I work with, I make comments based on the accurate analysis of the situation and available information.",
    "option2":
        "Regarding any group or people of the organization that I work with, based on understanding their needs, human emotions and myself, I comment on their behalf.",
    "type1": Types.T,
    "type2": Types.F
  },
  {
    "index": 52,
    "option1":
        "Usually, I start a work or project without wasting time and I deal with any part of it as early as possible.",
    "option2":
        "Usually, when doing things, I divide them into certain parts and then do the specified parts in order . ",
    "type1": Types.P,
    "type2": Types.J
  },
  {
    "index": 53,
    "option1":
        "I am interested in individual work (or at most with one or two other people).",
    "option2": "I am interested in group work.",
    "type1": Types.I,
    "type2": Types.E
  },
  {
    "index": 54,
    "option1":
        "One of the main problems in my life has been monotony and sticking to a specific plan and work.",
    "option2":
        "One of the main problems in my life has been jumping from branch to branch and having multiple programs.",
    "type1": Types.S,
    "type2": Types.N
  },
  {
    "index": 55,
    "option1": "Being decisive is my priority.",
    "option2": "Being gentle and emotional is my priority.",
    "type1": Types.T,
    "type2": Types.F
  },
  {
    "index": 56,
    "option1":
        "I would like meetings and gatherings to start when all people have the necessary presence and preparation and feel comfortable.",
    "option2":
        "I would like the meetings to start on time, and I insist on punctuality.",
    "type1": Types.P,
    "type2": Types.J
  },
  {
    "index": 57,
    "option1": "I may seem a bit withdrawn to others.",
    "option2": "Others may think that I am a well-spoken person.",
    "type1": Types.I,
    "type2": Types.E
  },
  {
    "index": 58,
    "option1": "I do things in order and step by step.",
    "option2":
        "I will do the important and interesting parts of the work sooner.",
    "type1": Types.S,
    "type2": Types.N
  },
  {
    "index": 59,
    "option1": "Following the principles and rules is very important to me.",
    "option2": "Kindness and forgiveness are very important to me in life.",
    "type1": Types.T,
    "type2": Types.F
  },
  {
    "index": 60,
    "option1":
        "I am not interested in being tied to a program that has been determined in advance.",
    "option2":
        "I feel satisfied with doing things that have been determined in advance.",
    "type1": Types.P,
    "type2": Types.J
  },
];
